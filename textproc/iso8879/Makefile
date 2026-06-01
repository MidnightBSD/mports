PORTNAME=	iso8879
PORTVERSION=	1986
PORTREVISION=	2
CATEGORIES=	textproc
MASTER_SITES=	${MASTER_SITE_FREEBSD_LOCAL}
MASTER_SITE_SUBDIR=	kuriyama
DISTNAME=	isoENTS
EXTRACT_SUFX=	.zip

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Character entity sets from ISO 8879:1986 (SGML)

LICENSE=	ISO8879
LICENSE_NAME=	ISO 8879 character entity sets
LICENSE_TEXT=	Permission to copy in any form is granted for use with conforming SGML systems and applications as defined in ISO 8879, provided this notice is included in all copies.
LICENSE_PERMS=	auto-accept dist-mirror pkg-mirror

BUILD_DEPENDS=	unzip:${PORTSDIR}/archivers/unzip
RUN_DEPENDS=	${XMLCATMGR}:${PORTSDIR}/textproc/xmlcatmgr

EXTRACT_ONLY=	# empty
NO_BUILD=	yes
NO_WRKSUBDIR=	yes
PLIST_SUB=	DTD_NAME=${PORTNAME} XMLCATMGR=${XMLCATMGR}
PLIST_SUB+=	CATALOG_PORTS_SGML=${CATALOG_PORTS_SGML}

INSTDIR=	${PREFIX}/share/sgml/iso8879
XMLCATMGR=	${LOCALBASE}/bin/xmlcatmgr
CATALOG_PORTS_SGML=	${PREFIX}/share/sgml/catalog.ports

pre-install:
	@[ -d ${INSTDIR} ] || ${MKDIR} ${INSTDIR}

do-install:
	${UNZIP_CMD} -a -q -o ${DISTDIR}/${DISTFILES} -d ${INSTDIR}
	${INSTALL_DATA} ${FILESDIR}/catalog ${INSTDIR}/catalog
	${CHMOD} ${SHAREMODE} ${INSTDIR}/*
	${CHOWN} -R ${SHAREOWN}:${SHAREGRP} ${INSTDIR}

.include <bsd.port.mk>
