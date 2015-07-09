# $MidnightBSD$
# $FreeBSD: head/Mk/Uses/jpeg.mk 390308 2015-06-22 18:30:35Z antoine $
#
# Handle dependency on jpeg
#
# Feature:	jpeg
# Usage:	USES=jpeg or USES=jpeg:ARGS
# Valid ARGS:	lib (default, implicit), build, run, both
#

.if !defined(_INCLUDE_USES_JPEG_MK)

_INCLUDE_USES_JPEG_MK=	yes
JPEG_PORT?=	graphics/jpeg

.if empty(jpeg_ARGS)
jpeg_ARGS=	lib
.endif

.if ${jpeg_ARGS} == lib
LIB_DEPENDS+=	libjpeg.so:${PORTSDIR}/${JPEG_PORT}
.elif ${jpeg_ARGS} == build
BUILD_DEPENDS+=	cjpeg:${PORTSDIR}/${JPEG_PORT}
.elif ${jpeg_ARGS} == run
RUN_DEPENDS+=	cjpeg:${PORTSDIR}/${JPEG_PORT}
.elif ${jpeg_ARGS} == both
BUILD_DEPENDS+=	cjpeg:${PORTSDIR}/${JPEG_PORT}
RUN_DEPENDS+=	cjpeg:${PORTSDIR}/${JPEG_PORT}
.else
IGNORE=		USES=jpeg - invalid args: [${jpeg_ARGS}] specified
.endif

.endif
