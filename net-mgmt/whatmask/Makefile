PORTNAME=	whatmask
PORTVERSION=	1.2
CATEGORIES=	net-mgmt
MASTER_SITES=	http://downloads.laffeycomputer.com/current_builds/whatmask/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Easily convert between three common subnet mask notations
WWW=		http://www.laffeycomputer.com/whatmask.html

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/COPYING

GNU_CONFIGURE=	yes

DOCS=		AUTHORS ChangeLog README

OPTIONS_DEFINE=	DOCS

post-install:
	@${MKDIR} ${DOCSDIR}
	cd ${WRKSRC} && ${INSTALL_DATA} ${DOCS} ${DOCSDIR}

.include <bsd.port.mk>
