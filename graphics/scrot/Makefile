# created by:	Chris Hutchinson <midnightbsd@BSDforge.com>
#
# $MidnightBSD$
PORTNAME=	scrot
DISTVERSION=	1.7
CATEGORIES=	graphics

MAINTAINER=	midnightbsd@BSDforge.com
COMMENT=	SCReenshOT - command line screen capture utility

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/COPYING

OPTIONS_DEFINE=		DOCS XTRA
OPTIONS_DEFAULT=	DOCS XTRA
XTRA_DESC=		Adds some convenience menu entries

OPTIONS_SUB=

BUILD_DEPENDS=	autoconf-archive>=0:devel/autoconf-archive

LIB_DEPENDS=	libImlib2.so:graphics/imlib2

USE_GITLAB=	yes
GL_ACCOUNT=	chrishutchinson
GL_PROJECT=	scrot
GL_COMMIT=	d93cccec

USES=		autoreconf desktop-file-utils xorg
USE_CSTD=	c99
GNU_CONFIGURE=	yes
USE_XORG=	x11 xfixes xcomposite

PORTDOCS=	AUTHORS ChangeLog README.md

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MXTRA}
DESKFILES=	scrot.area.desktop scrot.delayed.desktop scrot.desktop
BINFILES=	scrot-area scrot-delayed scrot-full
.endif

# There should probably be a GitLab equivelent for ${GH_TAGNAME_SANITIZED}
post-extract:
	${MV} ${WRKDIR}/scrot-d93cccec-d93cccec9f753805ca79b23ceb4436132fbbd491 \
	${WRKDIR}/scrot-d93cccec-d93cccec

post-install:
	${CP} ${BINFILES:S|^|${WRKSRC}/contrib/|} ${PREFIX}/bin/
	${CHMOD} 0755 ${PREFIX}/bin/*
	${CP} ${DESKFILES:S|^|${WRKSRC}/contrib/|} ${PREFIX}/share/applications/
	${CP} ${WRKSRC}/contrib/scrot.png ${PREFIX}/share/pixmaps/
	@${MKDIR} ${PREFIX}/share/icons/hicolor/48x48/apps/
	${CP} ${WRKSRC}/contrib/scrot.png ${PREFIX}/share/icons/hicolor/48x48/apps/

.include <bsd.port.mk>
