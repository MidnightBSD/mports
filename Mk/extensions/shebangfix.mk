# Replace #! interpreters in scripts by what we actually have.
#
# Standard templates for bash, perl, python,... are included out of
# the box, others can easily be added per port.
#
# Feature:	shebangfix
# Usage:	USES=shebangfix
#
#   SHEBANG_REGEX	a regular expression to match files that needs to be converted
#   SHEBANG_FILES	list of files or glob pattern relative to ${WRKSRC}
#   SHEBANG_GLOB	list of glob pattern find(1) will match with
#
# To specify that ${WRKSRC}/path1/file and all .pl files in ${WRKSRC}/path2
# should be processed:
#
#   SHEBANG_FILES=	path1/file path2/*.pl
#
# To define custom shebangs to replace, use the following (note that
# shebangs with spaces should be quoted):
#
#   perl_OLD_CMD=	/usr/bin/perl5.005 "/usr/bin/setenv perl5.005"
#
# To define a new shebang scheme add the following to the port Makefile:
#
#   SHEBANG_LANG=	lua
#   lua_OLD_CMD=	/usr/bin/lua
#   lua_CMD=	${LOCALBASE}/bin/lua
#
# To override a definition, for example replacing /usr/bin/perl by
# /usr/bin/env perl, add the following:
#
#   perl_CMD=	${SETENV} perl

.if !defined(_INCLUDE_USES_SHEBANGFIX_MK)
_INCLUDE_USES_SHEBANGFIX_MK=	yes

SHEBANG_LANG+=	bash java perl php python ruby tcl tk

.  if ${USES:Mlua*}
SHEBANG_LANG+=	lua
lua_CMD?=	${LOCALBASE}/bin/${LUA_CMD}
.  endif

tcl_OLD_CMD+=	/usr/bin/tclsh
tcl_CMD?=	${TCLSH}

tk_OLD_CMD+=	/usr/bin/wish
tk_CMD?=	${WISH}

.  if ${USES:Mpython*}
python_CMD?=	${PYTHON_CMD}
.  endif

.if ${USES:Mperl5*}
perl_CMD?=	${PERL}
.endif

# Replace the same patterns for all langs and setup a default, that may have
# been set already above with ?=.
.  for lang in ${SHEBANG_LANG}
${lang}_CMD?= ${LOCALBASE}/bin/${lang}
${lang}_OLD_CMD+= "/bin/env ${lang}"
${lang}_OLD_CMD+= "/usr/bin/env ${lang}"
${lang}_OLD_CMD+= /bin/${lang}
${lang}_OLD_CMD+= /usr/bin/${lang}
${lang}_OLD_CMD+= /usr/local/bin/${lang}
.  endfor

.  for pyver in 2 3
python_OLD_CMD+= "/bin/env python${pyver}"
python_OLD_CMD+= "/usr/bin/env python${pyver}"
python_OLD_CMD+= /bin/python${pyver}
python_OLD_CMD+= /usr/bin/python${pyver}
python_OLD_CMD+= /usr/local/bin/python${pyver}
.  endfor

.  for lang in ${SHEBANG_LANG}
.    if !defined(${lang}_CMD)
IGNORE+=	missing definition for ${lang}_CMD
.    endif
.    if !defined(${lang}_OLD_CMD)
IGNORE+=	missing definition for ${lang}_OLD_CMD
.    endif
.    for old_cmd in ${${lang}_OLD_CMD}
_SHEBANG_REINPLACE_ARGS+=	-e "1s|^\#![[:space:]]*${old_cmd:C/\"//g}\([[:space:]]\)|\#!${${lang}_CMD}\1|"
_SHEBANG_REINPLACE_ARGS+=	-e "1s|^\#![[:space:]]*${old_cmd:C/\"//g}$$|\#!${${lang}_CMD}|"
.    endfor
.  endfor

_USES_patch+=	210:fix-shebang
fix-shebang:
.  if defined(SHEBANG_REGEX)
	@cd ${WRKSRC}; \
		${FIND} -E . -type f -iregex '${SHEBANG_REGEX}' \
		-exec ${SED} -i '' ${_SHEBANG_REINPLACE_ARGS} {} +
.  endif
.  if defined(SHEBANG_GLOB)
.    for f in ${SHEBANG_GLOB}
	@cd ${WRKSRC}; \
		${FIND} . -type f -name '${f}' \
		-exec ${SED} -i '' ${_SHEBANG_REINPLACE_ARGS} {} +
.    endfor
.  endif
.  if defined(SHEBANG_FILES)
	@cd ${WRKSRC}; \
		${FIND} ${SHEBANG_FILES} -type f \
		-exec ${SED} -i '' ${_SHEBANG_REINPLACE_ARGS} {} +
.  endif

.endif
