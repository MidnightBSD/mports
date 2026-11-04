# Provide support to use the GNU make
#
# Feature:		gmake
# Usage:		USES=gmake
#

.if !defined(_INCLUDE_USES_GMAKE_MK)
_INCLUDE_USES_GMAKE_MK=	yes

.  if !empty(gmake_ARGS)
IGNORE=	Incorrect 'USES+= gmake:${gmake_ARGS}' gmake takes no arguments
.  endif

BUILD_DEPENDS+=		gmake>=4.4.1:devel/gmake
CONFIGURE_ENV+=		MAKE=${GMAKE}
MAKE_CMD=		${GMAKE}
# Clear MAKEFLAGS so bmake-specific flags (e.g. -DINSTALLS_DEPENDS) inherited
# via the environment when building as a dependency do not get passed to gmake,
# which does not understand bmake's -D syntax and will error out.
MAKE_ENV+=		MAKEFLAGS=

.endif
