# Github SSH setup

## Check for existing keys

```
ls -la ~/.ssh
```

## Generate

**NOTE: always use a password**

```
ssh-keygen -t ed25519 -C "your_email@gmail.com"
```

## Add to agent

```
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
```

## Add the SSH public key to your account on GitHub

```
pbcopy < ~/.ssh/id_ed25519.pub
```

Then, from any page on GitHub, click your profile picture, then click Settings.

In the "Access" section of the sidebar, click SSH and GPG keys.

Click New SSH key or Add SSH key.

In the "Title" field, add a descriptive label for the new key.

Select the type of key, either authentication or signing.

In the "Key" field, paste your public key.

Click Add SSH key.

If prompted, confirm access to your account on GitHub.
