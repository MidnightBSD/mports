# New ports collection makefile for:   docbook-xml
# Date created:        17 January 2002
# Whom:                des
#
# $MidnightBSD: mports/textproc/docbook-xsl/Makefile,v 1.4 2008/05/31 17:15:19 laffer1 Exp $
# $FreeBSD: ports/textproc/docbook-xsl/Makefile,v 1.39 2006/07/06 17:28:16 linimon Exp $
#

PORTNAME=	docbook-xsl
PORTVERSION=	1.71.1
CATEGORIES=	textproc
MASTER_SITES=	SF/docbook/${PORTNAME}/${PORTVERSION}:src \
 		SF/docbook/${PORTNAME}-doc/${PORTVERSION}:doc
DISTFILES=	${DISTNAME}${EXTRACT_SUFX}:src

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	XSL DocBook stylesheets
LICENSE=	other

RUN_DEPENDS=	${XMLDIR}/docbook/4.2/catalog.xml:${PORTSDIR}/textproc/docbook-xml \
		${XMLDIR}/sdocbook/1.1/catalog:${PORTSDIR}/textproc/sdocbook-xml

.ifndef NOPORTDOCS
DISTFILES+=	${PORTNAME}-doc-${PORTVERSION}${EXTRACT_SUFX}:doc
.endif

USE_BZIP2=	yes
NO_BUILD=	yes

XMLDIR=		${LOCALBASE}/share/xml
INSTDIR=	share/xsl/docbook
PINSTDIR=	${PREFIX}/${INSTDIR}
COPYDIRS=	common extensions fo highlighting html htmlhelp images \
		javahelp lib manpages params profiling slides \
		template tools wordml xhtml
PKGINSTALL=	${WRKDIR}/pkg-install
PKGDEINSTALL=	${WRKDIR}/pkg-deinstall

XMLCATMGR=	${LOCALBASE}/bin/xmlcatmgr
CATALOG_PORTS=	${XMLDIR}/catalog.ports

post-extract:
	${FIND} ${WRKSRC} -name '.#*' -delete
	${FIND} ${WRKSRC}/extensions -type d -mindepth 1 -maxdepth 1 -print0 |\
		${XARGS} -0 ${RM} -rf

post-configure:
	@${SED} -e 's,@INSTDIR@,${INSTDIR},g ; \
		s,@XMLCATMGR@,${XMLCATMGR},g ; \
		s,@CATALOG_PORTS_XML@,${CATALOG_PORTS},g' \
		< ${FILESDIR}/pkg-install.in > ${PKGINSTALL}
	@${SED} -e 's,@XMLCATMGR@,${XMLCATMGR},g ; \
		s,@CATALOG_PORTS_XML@,${CATALOG_PORTS},g' \
		< ${FILESDIR}/pkg-deinstall.in > ${PKGDEINSTALL}
do-install:
.ifndef NOPORTDOCS
	${MKDIR} ${DOCSDIR}
	(cd ${WRKSRC}/doc && ${TAR} -cf - . |\
		${TAR} -xf - -C${DOCSDIR})
.endif
	${MKDIR} ${PINSTDIR}
	(cd ${WRKSRC} && ${TAR} -cf - VERSION ${COPYDIRS} |\
		${TAR} -xf - -C${PINSTDIR})

.include <bsd.port.mk>
