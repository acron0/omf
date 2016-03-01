function gs
    git status
end

function gp
    git pull
end

function release
    env GIT_ALLOW_MASTER=1 lein release
end

set -g theme_complete_path yes

. vars.fish
