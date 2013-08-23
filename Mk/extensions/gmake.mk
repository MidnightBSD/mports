# $MidnightBSD$
#
# Provide support to use the GNU make
#
# Feature:		gmake
# Usage:		USES=gmake
#

.if !defined(_INCLUDE_USES_GMAKE_MK)
_INCLUDE_USES_GMAKE_MK=	yes

.if defined(gmake_ARGS)
IGNORE=	Incorrect 'USES+= gmake:${gmake_ARGS}' gmake takes no arguments
.endif

BUILD_DEPENDS+=		gmake:${PORTSDIR}/devel/gmake
CONFIGURE_ENV+=		MAKE=${GMAKE}
_MAKE_CMD=		${GMAKE}

.endif
