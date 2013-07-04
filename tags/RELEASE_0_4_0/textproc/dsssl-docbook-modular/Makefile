# New ports collection makefile for:	DSSSL stylesheets for DocBook
# Date created:		16 March 1998
# Whom:			Jun Kuriyama <kuriyama@opt.phys.waseda.ac.jp>
#
# $MidnightBSD: mports/textproc/dsssl-docbook-modular/Makefile,v 1.3 2008/01/04 21:22:34 laffer1 Exp $
# $FreeBSD: ports/textproc/dsssl-docbook-modular/Makefile,v 1.58 2005/06/13 20:54:18 glewis Exp $
#

PORTNAME=	dsssl-docbook-modular
PORTVERSION=	1.79
PORTREVISION=	2
PORTEPOCH=	1
CATEGORIES=	textproc
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE}
MASTER_SITE_SUBDIR=	docbook
DISTNAME=	docbook-dsssl-${PORTVERSION}
DISTFILES=	${DISTNAME}${EXTRACT_SUFX} docbook-dsssl-doc-${PORTVERSION}${EXTRACT_SUFX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	DSSSL stylesheets for the DocBook DTD by Norman Walsh
LICENSE=	other

PATCH_SITES=	http://dist.bsdlab.org/
PATCHFILES=	docbook-dsssl-mn-20070525.diff.gz
PATCH_DIST_STRIP=	-p1

BUILD_DEPENDS=	${XMLCATMGR}:${PORTSDIR}/textproc/xmlcatmgr
RUN_DEPENDS=	${BUILD_DEPENDS}

NO_MTREE=	yes

RELDIR=		docbook/dsssl/modular
INSTDIR=	${PREFIX}/share/sgml/${RELDIR}
XMLCATMGR=	${LOCALBASE}/bin/xmlcatmgr
CATALOG_PORTS_SGML=	${TRUE_PREFIX}/share/sgml/catalog.ports
PLIST_SUB=	XMLCATMGR=${XMLCATMGR} DTDDIR=${RELDIR} \
		CATALOG_PORTS_SGML=${CATALOG_PORTS_SGML}

do-build:
	${RM} -Rf ${WRKSRC}/docsrc

pre-su-install:
	${MKDIR} ${INSTDIR}
	${FIND} ${WRKDIR} -name '*.orig' -exec ${RM} {} \;
	${CHOWN} -R ${SHAREOWN}:${SHAREGRP} ${WRKSRC}

do-install:
	@cd ${WRKSRC} && ${TAR} cpf - . | (cd ${INSTDIR} && ${TAR} xpf -)

.include <bsd.port.mk>
