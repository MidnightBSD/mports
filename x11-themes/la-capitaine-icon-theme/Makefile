PORTNAME=	la-capitaine-icon-theme
DISTVERSIONPREFIX=v
DISTVERSION=	0.6.2
CATEGORIES=	x11-themes

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Icon pack designed to integrate with most desktop environments

LICENSE=	gpl3
LICENSE_FILE=	${WRKSRC}/LICENSE

USE_GITHUB=	YES
GH_ACCOUNT=	keeferrourke

NO_BUILD=	YES

post-extract:
.for logo in kubuntu debian-logo configure-debian debian debian-plymouth-manager archlinux gnome-debian
	${RM} ${WRKSRC}/apps/scalable/${logo}.svg
.endfor

do-install:
	${MKDIR} ${PREFIX}/share/icons/La-Capitaine
.for dir in actions animations apps devices emblems emotes mimetypes panel places status
	${CP} -rp ${WRKSRC}/${dir} ${PREFIX}/share/icons/La-Capitaine
.endfor
	${INSTALL_DATA} ${WRKSRC}/index.theme ${PREFIX}/share/icons/La-Capitaine

.include <bsd.port.mk>
