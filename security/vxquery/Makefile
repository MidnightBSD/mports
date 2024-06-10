PORTNAME=	vxquery
PORTVERSION=	0.2.1
CATEGORIES=	security textproc
MASTER_SITES=	http://www.vuxml.org/files/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	VuXML Query Tool

LICENSE=	bsd2

USES=	tar:bzip2
GNU_CONFIGURE=	yes

USE_CXXSTD=	c++14

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/object/vxquery ${PREFIX}/bin
	${INSTALL_SCRIPT} ${FILESDIR}/pkg_check.sh ${PREFIX}/bin

.include <bsd.port.mk>
