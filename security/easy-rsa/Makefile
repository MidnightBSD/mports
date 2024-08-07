PORTNAME=	easy-rsa
DISTVERSION=	3.2.0
CATEGORIES=	security net-mgmt
MASTER_SITES=	https://github.com/OpenVPN/easy-rsa/releases/download/v${DISTVERSION}/ \
		FREEBSD_LOCAL/mandree/
DISTNAME=	EasyRSA-${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Small RSA key management package based on openssl
WWW=		https://github.com/OpenVPN/easy-rsa

LICENSE=	gpl2

USES=		tar:tgz

CONFLICTS_INSTALL=easy-rsa2

NO_BUILD=	yes
NO_ARCH=	yes

WRKSRC=		${WRKDIR}/EasyRSA-${DISTVERSION}

OPTIONS_DEFINE=		DOCS EXAMPLES

PORTDATA=	x509-types/
_pd_files=	ChangeLog COPYING.md README.md README.quickstart.md mktemp.txt
_pd_dirs=	doc/
PORTDOCS=	${_pd_files} ${_pd_dirs}
SUB_FILES=	pkg-message

do-install:
		${MKDIR} ${STAGEDIR}${PREFIX}/bin
		${MKDIR} ${STAGEDIR}${DATADIR}/x509-types/
		${INSTALL_SCRIPT} ${WRKSRC}/easyrsa ${STAGEDIR}${PREFIX}/bin/
		${LN} -fh ${STAGEDIR}${PREFIX}/bin/easyrsa ${STAGEDIR}${PREFIX}/bin/easy-rsa
		${INSTALL_DATA} ${WRKSRC}/vars.example ${STAGEDIR}${DATADIR}/
		${INSTALL_DATA} ${WRKSRC}/openssl-easyrsa.cnf ${STAGEDIR}${DATADIR}/openssl-easyrsa.cnf.example
		(cd ${WRKSRC}/x509-types/ && ${COPYTREE_SHARE} . ${STAGEDIR}${DATADIR}/x509-types/)

do-install-DOCS-on:
		${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
.for i in ${_pd_files}
		${INSTALL_DATA} ${WRKSRC}/${i} ${FAKE_DESTDIR}${DOCSDIR}
.endfor
.for i in ${_pd_dirs}
		${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}/${i}
		(cd ${WRKSRC}/${i} && ${COPYTREE_SHARE} . ${FAKE_DESTDIR}${DOCSDIR}/${i})
.endfor

.include <bsd.port.mk>
