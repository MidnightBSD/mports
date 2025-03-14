PORTNAME=	drawio
PORTVERSION=	24.1.0
DISTVERSIONPREFIX=	x86_64-
CATEGORIES=	graphics
MASTER_SITES=	https://github.com/jgraph/drawio-desktop/releases/download/v${PORTVERSION}/
EXTRACT_SUFX=	.rpm

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Diagramming and whiteboarding desktop app
WWW=		https://drawio.com/

LICENSE=	apache2

USES=		desktop-file-utils electronfix:28 shared-mime-info

NO_BUILD=	yes
SUB_FILES=	drawio
NO_WRKSUBDIR=	yes

ELECTRONFIX_MAIN_EXECUTABLE=	drawio

do-install:
	cd ${WRKSRC}/opt/ && ${COPYTREE_SHARE} ${PORTNAME} ${FAKE_DESTDIR}${TRUE_PREFIX}/share
	cd ${WRKSRC}/usr/share && ${COPYTREE_SHARE} . ${FAKE_DESTDIR}${TRUE_PREFIX}/share
	${INSTALL_SCRIPT} ${WRKDIR}/${PORTNAME} ${FAKE_DESTDIR}${TRUE_PREFIX}/bin
	${FIND} ${FAKE_DESTDIR}${TRUE_PREFIX} -name '*.orig' -delete

.include <bsd.port.mk>
