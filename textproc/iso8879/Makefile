PORTNAME=	iso8879
PORTVERSION=	1986
PORTREVISION=	2
CATEGORIES=	textproc
MASTER_SITES=	${MASTER_SITE_FREEBSD_LOCAL}
MASTER_SITE_SUBDIR=	kuriyama
DISTNAME=	isoENTS

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Character entity sets from ISO 8879:1986 (SGML)

LICENSE=	ISO8879
LICENSE_NAME=	ISO 8879 character entity sets
LICENSE_TEXT=	Permission to copy in any form is granted for use with conforming SGML systems and applications as defined in ISO 8879, provided this notice is included in all copies.
LICENSE_PERMS=	auto-accept dist-mirror pkg-mirror

RUN_DEPENDS=	${XMLCATMGR}:textproc/xmlcatmgr

USES=		zip
NO_BUILD=	yes
NO_WRKSUBDIR=	yes
PLIST_SUB=	DTD_NAME=${PORTNAME} XMLCATMGR=${XMLCATMGR} \
		CATALOG_PORTS_SGML=${CATALOG_PORTS_SGML}

INSTDIR=	${PREFIX}/share/sgml/iso8879
XMLCATMGR=	${LOCALBASE}/bin/xmlcatmgr
CATALOG_PORTS_SGML=	${PREFIX}/share/sgml/catalog.ports

do-install:
	${MKDIR} ${INSTDIR}
	${INSTALL_DATA} ${WRKSRC}/ISO* ${INSTDIR}
	${INSTALL_DATA} ${FILESDIR}/catalog ${INSTDIR}/catalog

.include <bsd.port.mk>
