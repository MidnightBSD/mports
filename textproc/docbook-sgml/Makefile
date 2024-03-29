PORTNAME=	docbook
PORTVERSION=	4.5
PORTREVISION=	2
CATEGORIES=	textproc
MASTER_SITES=	${DBFILES:C,(.*):(.*),http://www.oasis-open.org/docbook/sgml/\1/:\2,:C,:docbook-([0-9]+).([0-9]+),:db\1\2,}
PKGNAMESUFFIX=	-sgml
DISTFILES=	${DBFILES:C,.*:(.*),\1.zip:\1,:C,:docbook-([0-9]+).([0-9]+),:db\1\2,}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	DocBook SGML DTD

LICENSE=	unknown

EXTRACT_DEPENDS=	${LOCALBASE}/bin/bsdtar:archivers/libarchive

RUN_DEPENDS=	${LOCALBASE}/${ISOCAT}:textproc/iso8879 \
		${LOCALBASE}/${XMLCATMGR}:textproc/xmlcatmgr

NO_BUILD=	yes

DBFILES=2.4.1:docbk241	3.0:docbk30	3.1:docbk31 \
	4.0:docbk40	4.1:docbk41	4.2:docbook-4.2 \
	4.3:docbook-4.3	4.4:docbook-4.4	4.5:docbook-4.5

XMLCATMGR=	bin/xmlcatmgr
SGMLCAT=	share/sgml/catalog.ports
ISOCAT=		share/sgml/iso8879/catalog
DBKDIR=		share/sgml/docbook
DBCAT=	${TRUE_PREFIX}/${DBKDIR}/catalog
PLIST_SUB=	XMLCATMGR=${XMLCATMGR} SGMLCAT=${SGMLCAT} DBKDIR=${DBKDIR}

do-extract:
	@${RM} -rf ${WRKDIR}
	@${MKDIR} ${WRKDIR}
.for df in ${DISTFILES:C,:.*,,}
	@cd ${WRKDIR} && /usr/local/bin/bsdtar \
		${EXTRACT_BEFORE_ARGS} ${DISTDIR}/${df} \
		${EXTRACT_AFTER_ARGS} -s ,^,${df:R}/,
.endfor

pre-install:
	@${MKDIR} ${PREFIX}/${DBKDIR}
	${ECHO_CMD} "CATALOG \"${LOCALBASE}/${ISOCAT}\"" \
	    > ${FAKE_DESTDIR}${DBCAT}

.for D in ${DBFILES:C,:.*,,}
do-install-${D:S/./_/g}:
	@${MKDIR} ${PREFIX}/share/sgml/docbook/$D
	cd ${WRKDIR}/${DBFILES:M${D}\:*:C,.*:,,} && \
	    ${COPYTREE_SHARE} . ${PREFIX}/share/sgml/docbook/$D
	${ECHO_CMD} "CATALOG \"${TRUE_PREFIX}/share/sgml/docbook/$D/docbook.cat\"" \
	    >> ${FAKE_DESTDIR}${DBCAT}
do-install: do-install-${D:S/./_/g}
.endfor

.include <bsd.port.mk>
