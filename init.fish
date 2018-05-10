function gs
    git status
end

function gp
    git pull
end

function release
    env GIT_ALLOW_MASTER=1 lein release
end

function heimdall-repl-staging
    lein repl :connect (curl "http://masters.staging.witan.mastodonc.net/marathon/v2/apps/kixi.heimdall/tasks" 2> /dev/null | jq '.tasks[].host' | sort -R | head -n 1 | xargs echo):10011
end

function heimdall-repl-prod
    lein repl :connect (curl "http://masters.prod.witan.mastodonc.net/marathon/v2/apps/kixi.heimdall/tasks" 2> /dev/null | jq '.tasks[].host' | sort -R | head -n 1 | xargs echo):10011
end

function datastore-repl-staging
    lein repl :connect (curl "http://masters.staging.witan.mastodonc.net/marathon/v2/apps/kixi.datastore/tasks" 2> /dev/null | jq '.tasks[].host' | sort -R | head -n 1 | xargs echo):10016
end

function datastore-repl-prod
    lein repl :connect (curl "http://masters.prod.witan.mastodonc.net/marathon/v2/apps/kixi.datastore/tasks" 2> /dev/null | jq '.tasks[].host' | sort -R | head -n 1 | xargs echo):10016
end

function vpn-staging
    sudo openvpn --config /etc/openvpn/mastodonc-mesos-staging-vpn.conf
end

function vpn-prod
    sudo openvpn --config /etc/openvpn/mastodonc-mesos-prod-vpn.conf
end

function k
    kubectl $argv
end

function kaylee
    sh ~/projects/mc/kaylee-tools/scripts/checker-matt-edition.sh
end

function git-branches
     for x in (ls -d */)
      pushd $x;
      if test -d .git
         set branch (git rev-parse --abbrev-ref HEAD);
         printf "%-30s " $x;
         if not test $branch = "master"
            set_color red;
         else
            set_color green;
         end
         printf $branch;
         printf "\n";
         set_color normal;
      end
      popd;
    end
end

set -g theme_complete_path yes
set -g theme_display_time yes
set -g theme_display_group no

. ~/.config/omf/vars.fish
