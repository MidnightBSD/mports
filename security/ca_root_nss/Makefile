PORTNAME=	ca_root_nss
PORTVERSION=	${VERSION_NSS}
PORTREVISION=	1
CATEGORIES=	security
MASTER_SITES=	MOZILLA/security/nss/releases/${DISTNAME:tu:C/[-.]/_/g}_RTM/src
DISTNAME=	nss-${VERSION_NSS}${NSS_SUFFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The root certificate bundle from the Mozilla Project

LICENSE=	mpl

OPTIONS_DEFINE=	ETCSYMLINK
OPTIONS_DEFAULT= ETCSYMLINK
ETCSYMLINK_DESC=	Add symlink to /etc/ssl/cert.pem

USE_PERL5_BUILD=	yes
NO_WRKSUBDIR=	yes

CERTDIR?=	share/certs
PLIST_SUB+=	CERTDIR=${CERTDIR}

# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
# !!!  These versions are indented to track security/nss.        !!!
# !!!  Please DO NOT submit patches for new version until it has !!!
# !!!  been committed there first.                               !!!
# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
VERSION_NSS=	3.89
CERTDATA_TXT_PATH=	nss-${VERSION_NSS}/nss/lib/ckfw/builtins/certdata.txt
BUNDLE_PROCESSOR=	MAca-bundle.pl

SUB_FILES=	MAca-bundle.pl pkg-message
SUB_LIST=	VERSION_NSS=${VERSION_NSS}

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:METCSYMLINK}
PLIST_SUB+=	ETCSYMLINK=
CONFLICTS=	ca-roots-[0-9]*
.else
PLIST_SUB+=	ETCSYMLINK="@comment "
.endif

do-extract:
	@${MKDIR} ${WRKDIR}
	@${TAR} -C ${WRKDIR} -xf ${DISTDIR}/nss-${VERSION_NSS}${NSS_SUFFIX}${EXTRACT_SUFX} \
	    ${CERTDATA_TXT_PATH}
	@${CP} ${WRKDIR}/${CERTDATA_TXT_PATH} ${WRKDIR}
	@${RM} -rf ${WRKDIR}/nss-${VERSION_NSS}

do-build:	apply-slist
	@${PERL} ${WRKDIR}/${BUNDLE_PROCESSOR} \
	    < ${WRKDIR}/certdata.txt > \
	    ${WRKDIR}/ca-root-nss.crt

do-install:
	${MKDIR} ${PREFIX}/${CERTDIR}
	${INSTALL_DATA} ${WRKDIR}/ca-root-nss.crt ${PREFIX}/${CERTDIR}
.if ${PORT_OPTIONS:METCSYMLINK}
	${LN} -sf ${PREFIX}/${CERTDIR}/ca-root-nss.crt /etc/ssl/cert.pem
.endif
	${MKDIR} ${PREFIX}/etc/ssl
	${LN} -sf ${PREFIX}/${CERTDIR}/ca-root-nss.crt ${PREFIX}/etc/ssl/cert.pem.sample
	${MKDIR} ${PREFIX}/openssl
	${LN} -sf ${PREFIX}/${CERTDIR}/ca-root-nss.crt ${PREFIX}/openssl/cert.pem.sample

.include <bsd.port.mk>
