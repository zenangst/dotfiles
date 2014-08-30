function inspect-code
    if test -f compile_commands.json
        rm compile_commands.json
    end

    if test -f xcodebuild.log
        rm xcodebuild.log
    end

    /usr/bin/xcodebuild clean;
    and /usr/bin/xcodebuild >> xcodebuild.log;
    and /usr/local/bin/oclint-xcodebuild;
    and oclint-json-compilation-database oclint_args "-rc LONG_LINE=120" | sed 's/\(.*\.\m\{1,2\}:[0-9]*:[0-9]*:\)/\1 warning:/' >> oclint.log
    and coda oclint.log
end
