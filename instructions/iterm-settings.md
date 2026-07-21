# Set up iTerm like Guake

## Download iTerm themes

```
git clone git@github.com:mbadolato/iTerm2-Color-Schemes.git
```

## Create custom profile

- Go to iTerm2 > Settings > Profiles
- Click plus sign (`+`) to add a new profile
- Give it a name (e.g. "guake-style")

### General tab

- Icon: no icon
  - Initial directory Users/<username>/Dev

### Colors tab

- Modes: Use separate
- Editing: Dark Mode
- Set color scheme
  1.  Click "Color Presets", then scroll down to "Import..".
  2.  Navigate to iTerm2-Color-Schemes > schemes > Select all "Black Metal" themes
  3.  Click "Color Preset" again and select "Black Metal"

### Text tab

- Cursor: `_`
- Text rendering: allow italic text, draw bold text in bold font
- Font: Monoid
- Non ASCII font: Monoid

### Window Tab

- Transparency: 30
- Keep background colors opaque: off
- Blur: off
- New Windows:
  - Style: Full-Width Top of Screen
  - Use Transparency: on

### Terminal tab

- Report terminal type: xterm-256color

## Set profile as default

Click on the name of the profile just created in the list on the left. Click "Other Actions".
Click "Set as default". A star should appear next to the profile name.
