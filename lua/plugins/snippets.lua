local snippets = require('snippets')
local U = require('snippets.utils')

-- snippets.set_ux(require('snippets.inserters.vim_input'))
snippets.use_suggested_mappings()
snippets.snippets = {
  lua = {
    req = [[local ${2:${1|S.v:match"([^.()]+)[()]*$"}} = require '$1']];
    func = [[function${1|vim.trim(S.v):gsub("^%S"," %0")}(${2|vim.trim(S.v)})$0 end]];
    ["local"] = [[local ${2:${1|S.v:match"([^.()]+)[()]*$"}} = ${1}]];
    -- Match the indentation of the current line for newlines.
    ["for"] = U.match_indentation([[
for ${1:i}, ${2:v} in ipairs(${3:t}) do
  $0
end]]);
  };
  go = {
    debugp = U.match_indentation([[
debug, _ := json.Marshal(${0})
fmt.Println(string(debug))
    ]]);
    debugpp = U.match_indentation([[
import "github.com/k0kubun/pp"
pp.Println(${0})
    ]]);
  };
  php = {
    class = [[
<?php

declare(strict_types=1);

namespace ${1}

class ${2}
{
    ${0}
    public function __construct(${3})
    {
        ${4}
    }
}
]];
    interface = [[
<?php 

declare(strict_types=1);

namespace ${1}

interface ${2}
{
  public function ${3}(${4})${5};
    ${0}
}
]];
    ["public static"] = U.match_indentation([[
public static function ${1}(${2})${3}
{
    ${0}
}]]);
    ["public"] = U.match_indentation([[
public function ${1}(${2})${3}
{
    ${0}
}]]);
    ["private static"] = U.match_indentation([[
private static function ${1}(${2})${3}
{
    ${0}
}]]);
    ["app("] = U.match_indentation([[
private function get${1}(): ${1}
{
    return app(${1}::class);
}
${0}]]);
    ["private"] = U.match_indentation([[
private function ${1}(${2})${3}
{
    ${0}
}]]);
    ["protected static"] = U.match_indentation([[
protected static function ${1}(${2})${3}
{
    ${0}
}]]);
    ["protected"] = U.match_indentation([[
protected function ${1}(${2})${3}
{
    ${0}
}]]);
    ["foreach"] = U.match_indentation([[
foreach (${1:iterable} as ${2:value}) {
    ${0}
}]]);
    ["foreachkey"] = U.match_indentation([[
foreach (${1:iterable} as ${2:key} => ${3:value}) {
    ${0}
}]]);
    ["phpcs-ignore"] = U.match_indentation([[
// phpcs:ignore ${0}
]]);
    ["phpcs-disable"] = U.match_indentation([[
// phpcs:disable ${0}
]]);
    ["phpcs-enable"] = U.match_indentation([[
// phpcs:enable ${0}
]]);
    ["phpmd-suppressWarnings"] = U.match_indentation([[
@SuppressWarnings(PHPMD.${1:CouplingBetweenObjects}) ${0}
]]);
    ["debugmem"] = U.match_indentation([[
printf("Memory: %s megabytes\n", round(memory_get_usage(true) / 1048576, 2));
${0}]]);
    ["debugdb"] = U.match_indentation([[
\Illuminate\Support\Facades\DB::listen(function (\$query) {
	\Illuminate\Support\Facades\Log::info(
		\$query->sql,
		\$query->bindings,
		\$query->time
	);
});
${0}]]);
    ["debugtime"] = U.match_indentation([[
\$time_start = microtime(true);

${0}

\$time_end = microtime(true);
\$time = \$time_end - \$time_start;
echo "execution took \$time seconds\n";
]]);
    ["debugtest"] = U.match_indentation([[
\$debug = ${0};
\Illuminate\Support\Facades\Log::info(var_export(\$debug, true));
]]);
    ["measure"] = U.match_indentation([[
start_measure(__METHOD__);
stop_measure(__METHOD__);${0}]]);
  };
  _global = {
    -- If you aren't inside of a comment, make the line a comment.
    copyright = U.force_comment([[Copyright (C) Daniel Pieper ${=os.date("%Y")}]]);
    prob = U.match_indentation([[
**Problem**

${1}

**Solution**

${0}]]);
  };
}
