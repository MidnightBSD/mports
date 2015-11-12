# $MidnightBSD$

PORTNAME=	obmenu
PORTVERSION=	1.0
CATEGORIES=	x11-wm
MASTER_SITES=	SF

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Menu manager for Openbox supporting both static and pipe menus

LICENSE=	gpl2

USES=			python
USE_GNOME=		pygtk2
USE_PYTHON=		distutils
PYDISTUTILS_PKGNAME=	obMenu

PORTDOCS=	README

post-install:
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
.for file in ${PORTDOCS}
	${INSTALL_DATA} ${WRKSRC}/${file} ${DOCSDIR}
.endfor
.endif

.include <bsd.port.mk>
