# Initialize Homebrew
eval (/opt/homebrew/bin/brew shellenv)

if status is-interactive
    # Commands to run in interactive sessions can go here
    set -g theme_color_scheme "rose-pine-moon"
end
#source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.fish.inc
starship init fish | source
