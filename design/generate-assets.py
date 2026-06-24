from pathlib import Path
from PIL import Image, ImageDraw, ImageFont, ImageFilter

ROOT = Path(__file__).resolve().parents[1]
EXPORTS = ROOT / "design" / "exports"
APP_ASSETS = ROOT / "app" / "assets"

COLORS = {
    "night": "#100B08",
    "night_surface": "#1D130D",
    "paper": "#FFF8EA",
    "paper_alt": "#F3E7D2",
    "brass": "#D6A24E",
    "brass_dark": "#B7791F",
    "teal": "#275C65",
    "teal_light": "#6FA5A0",
    "lacquer": "#9E3F2F",
    "text": "#26170F",
    "muted": "#6F5944",
    "border": "#E7D6B8",
}


def hex_to_rgb(value):
    value = value.lstrip("#")
    return tuple(int(value[i:i + 2], 16) for i in (0, 2, 4))


def font(size, bold=False):
    candidates = [
        "/System/Library/Fonts/Avenir Next Condensed.ttc",
        "/System/Library/Fonts/Avenir.ttc",
        "/System/Library/Fonts/HelveticaNeue.ttc",
        "/System/Library/Fonts/SFNS.ttf",
    ]
    for candidate in candidates:
        try:
            return ImageFont.truetype(candidate, size=size, index=2 if bold else 0)
        except Exception:
            continue
    return ImageFont.load_default()


def center_text(draw, box, text, fill, size, bold=False):
    fnt = font(size, bold=bold)
    bbox = draw.textbbox((0, 0), text, font=fnt)
    x = box[0] + (box[2] - box[0] - (bbox[2] - bbox[0])) / 2
    y = box[1] + (box[3] - box[1] - (bbox[3] - bbox[1])) / 2 - bbox[1]
    draw.text((x, y), text, fill=fill, font=fnt)


def rounded_mask(size, radius):
    mask = Image.new("L", size, 0)
    draw = ImageDraw.Draw(mask)
    draw.rounded_rectangle((0, 0, size[0], size[1]), radius=radius, fill=255)
    return mask


def vertical_gradient(size, top, bottom):
    top_rgb = hex_to_rgb(top)
    bottom_rgb = hex_to_rgb(bottom)
    img = Image.new("RGB", size)
    px = img.load()
    for y in range(size[1]):
        ratio = y / max(1, size[1] - 1)
        color = tuple(int(top_rgb[i] * (1 - ratio) + bottom_rgb[i] * ratio) for i in range(3))
        for x in range(size[0]):
            px[x, y] = color
    return img.convert("RGBA")


def draw_mark(draw, cx, cy, scale=1.0, monochrome=False):
    brass = COLORS["paper"] if monochrome else COLORS["brass"]
    teal = COLORS["paper"] if monochrome else COLORS["teal_light"]
    lacquer = COLORS["paper"] if monochrome else COLORS["lacquer"]
    stroke = int(24 * scale)
    # Open book
    draw.arc(
        (cx - int(260 * scale), cy - int(60 * scale), cx - int(10 * scale), cy + int(260 * scale)),
        195,
        344,
        fill=brass,
        width=stroke,
    )
    draw.arc(
        (cx + int(10 * scale), cy - int(60 * scale), cx + int(260 * scale), cy + int(260 * scale)),
        196,
        345,
        fill=brass,
        width=stroke,
    )
    draw.line((cx, cy + int(70 * scale), cx, cy + int(250 * scale)), fill=brass, width=int(12 * scale))
    # Moon
    draw.ellipse(
        (cx - int(118 * scale), cy - int(225 * scale), cx + int(118 * scale), cy + int(11 * scale)),
        outline=brass,
        width=stroke,
    )
    draw.ellipse(
        (cx - int(48 * scale), cy - int(236 * scale), cx + int(142 * scale), cy - int(25 * scale)),
        fill=COLORS["night"] if not monochrome else (0, 0, 0, 0),
    )
    # Three language sparks
    for dx, dy, color in [(-152, -4, teal), (0, -42, brass), (152, -4, lacquer)]:
        r = int(18 * scale)
        draw.ellipse((cx + int(dx * scale) - r, cy + int(dy * scale) - r, cx + int(dx * scale) + r, cy + int(dy * scale) + r), fill=color)


def make_icon(size=1024, monochrome=False, transparent=False):
    bg = (0, 0, 0, 0) if transparent else COLORS["night"]
    img = Image.new("RGBA", (size, size), bg)
    draw = ImageDraw.Draw(img)
    if not monochrome and not transparent:
        draw.rounded_rectangle((96, 96, size - 96, size - 96), radius=178, fill=COLORS["night_surface"], outline=COLORS["brass"], width=10)
        draw.ellipse((690, 118, 858, 286), fill=COLORS["teal"])
        draw.ellipse((728, 118, 896, 286), fill=COLORS["night_surface"])
    draw_mark(draw, size // 2, size // 2, scale=size / 1024, monochrome=monochrome)
    return img


def make_splash():
    img = vertical_gradient((1242, 2436), COLORS["night"], COLORS["night_surface"])
    draw = ImageDraw.Draw(img)
    draw.ellipse((860, 280, 1050, 470), fill=COLORS["teal"])
    draw.ellipse((904, 278, 1090, 474), fill=COLORS["night_surface"])
    mark = make_icon(620, transparent=True)
    img.alpha_composite(mark, (311, 650))
    center_text(draw, (0, 1280, 1242, 1395), "Nitean", COLORS["paper"], 86, bold=True)
    center_text(draw, (0, 1400, 1242, 1475), "Khmer stories in three languages", COLORS["brass"], 34)
    center_text(draw, (0, 1478, 1242, 1540), "made for bedtime", COLORS["teal_light"], 32)
    return img


def make_cover_template():
    img = vertical_gradient((1200, 900), COLORS["paper"], COLORS["paper_alt"])
    draw = ImageDraw.Draw(img)
    draw.rectangle((0, 700, 1200, 900), fill="#EBD7B5")
    draw.ellipse((105, 92, 515, 502), fill=COLORS["teal"])
    draw.ellipse((178, 92, 588, 502), fill=COLORS["paper_alt"])
    draw.rounded_rectangle((730, 150, 1038, 564), radius=28, fill=COLORS["night_surface"], outline=COLORS["brass"], width=8)
    draw.arc((210, 406, 590, 760), 200, 342, fill=COLORS["brass_dark"], width=18)
    draw.arc((610, 406, 990, 760), 198, 340, fill=COLORS["brass_dark"], width=18)
    draw.line((600, 552, 600, 736), fill=COLORS["brass_dark"], width=8)
    draw.rounded_rectangle((80, 70, 1120, 830), radius=24, outline=COLORS["border"], width=4)
    center_text(draw, (0, 760, 1200, 840), "Cover safe area: keep title-critical detail above this band", COLORS["muted"], 28)
    return img


def save_all():
    EXPORTS.mkdir(parents=True, exist_ok=True)
    APP_ASSETS.mkdir(parents=True, exist_ok=True)

    icon = make_icon()
    icon.save(EXPORTS / "nitean-icon-1024.png")
    icon.save(APP_ASSETS / "icon.png")

    make_icon(1024, transparent=True).save(APP_ASSETS / "android-icon-foreground.png")
    Image.new("RGBA", (1024, 1024), COLORS["night"]).save(APP_ASSETS / "android-icon-background.png")
    make_icon(1024, monochrome=True, transparent=True).save(APP_ASSETS / "android-icon-monochrome.png")

    splash_icon = make_icon(1024, transparent=True)
    splash_icon.save(APP_ASSETS / "splash-icon.png")
    make_splash().save(EXPORTS / "nitean-splash-1242x2436.png")
    make_cover_template().save(EXPORTS / "story-cover-template.png")
    icon.resize((48, 48), Image.Resampling.LANCZOS).save(APP_ASSETS / "favicon.png")


if __name__ == "__main__":
    save_all()
