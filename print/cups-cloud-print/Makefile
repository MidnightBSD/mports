# $MidnightBSD$
# $FreeBSD: head/print/cups-cloud-print/Makefile 410825 2016-03-11 11:53:42Z tijl $

PORTNAME=	cups-cloud-print
PORTVERSION=	20140814.3
PORTREVISION=	0
CATEGORIES=	print

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Print using Google Cloud Print

LICENSE=	gpl3
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	cups-config:${PORTSDIR}/print/cups
RUN_DEPENDS=	cancel:${PORTSDIR}/print/cups \
		${PYTHON_PKGNAMEPREFIX}pycups>0:print/py-pycups@${PY_FLAVOR} \
		bash:${PORTSDIR}/shells/bash \
		${PYTHON_PKGNAMEPREFIX}httplib2>0:www/py-httplib2@${PY_FLAVOR}

NO_ARCH=	yes
NO_BUILD=	yes

USE_GITHUB=	yes
GH_ACCOUNT=	simoncadman
GH_PROJECT=	CUPS-Cloud-Print

USES=		gmake python shebangfix
SHEBANG_FILES=	testing/*.sh
GNU_CONFIGURE=	yes
MAKE_ARGS=	NOPERMS=1

DATADIR=	${PREFIX}/share/cloudprint-cups
DOCSDIR=	${PREFIX}/share/doc/cloudprint-cups

OPTIONS_DEFINE=	DOCS

post-patch:
	@${REINPLACE_CMD} -e \
		'/README.md/s|^|#| ; \
		 /COPYING/s|^|#|' ${WRKSRC}/Makefile.in

post-install:
	@${MKDIR} ${STAGEDIR}${DOCSDIR}
	(cd ${WRKSRC} && ${INSTALL_DATA} README.md ${STAGEDIR}${DOCSDIR})

.include <bsd.port.mk>
