# $MidnightBSD$
# $FreeBSD: ports/multimedia/gstreamer-plugins-bad/Makefile,v 1.10 2007/06/26 12:37:51 ahze Exp $

CATEGORIES=	multimedia

COMMENT=	Bad gstreamer-plugins

GST_PLUGIN=	bad
GST_PLUGIN_SUFFIX=	-bad

MASTERDIR=	${.CURDIR}/../../multimedia/gstreamer-plugins

BUILD_DEPENDS+=	gstreamer-plugins>=${GST_VERSION}${GST_MINOR_VERSION}:${PORTSDIR}/multimedia/gstreamer-plugins \
		v4l_compat>=1.0.20100321:${PORTSDIR}/multimedia/v4l_compat
RUN_DEPENDS+=	gstreamer-plugins>=${GST_VERSION}${GST_MINOR_VERSION}:${PORTSDIR}/multimedia/gstreamer-plugins \
		v4l_compat>=1.0.20100321:${PORTSDIR}/multimedia/v4l_compat

gst_bad_DIST=	bad
BAD_GST_DIRS=	gst-libs sys gst po
PLIST_SUB=	VERSION="${GST_VERSION}"
NO_GSTREAMER_COMMON=	yes
PLIST=	${.CURDIR}/pkg-plist

CONFIGURE_ARGS+=--mandir=${PREFIX}/man
USE_GL=		yes

do-build:
.for dir in ${BAD_GST_DIRS}
	@(cd ${BUILD_WRKSRC}/${dir}; ${SETENV} ${MAKE_ENV} ${GMAKE} ${MAKE_FLAGS} ${MAKEFILE} ${MAKE_ARGS} ${FAKE_MAKEARGS} ${ALL_TARGET})
.endfor

do-install:
.for dir in ${BAD_GST_DIRS}
	@(cd ${INSTALL_WRKSRC}/${dir} && ${SETENV} ${MAKE_ENV} ${GMAKE} ${MAKE_FLAGS} ${MAKEFILE} ${MAKE_ARGS} ${FAKE_MAKEARGS} ${INSTALL_TARGET})

.endfor

.include "${MASTERDIR}/Makefile"
