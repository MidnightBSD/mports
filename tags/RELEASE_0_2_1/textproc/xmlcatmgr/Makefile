# Ports collection makefile for:  xmlcatmgr
# Date created:			  Sat May 24, 2003
# Whom:				  Hiroki Sato <hrs@FreeBSD.org>
#
# $MidnightBSD: mports/textproc/xmlcatmgr/Makefile,v 1.3 2007/05/06 23:27:38 ctriv Exp $
# $FreeBSD: ports/textproc/xmlcatmgr/Makefile,v 1.11 2005/01/01 00:49:22 hrs Exp $
#

PORTNAME=	xmlcatmgr
PORTVERSION=	2.2
CATEGORIES=	textproc
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE}
MASTER_SITE_SUBDIR=	${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	SGML and XML catalog manager
LICENSE=	bsd3

MAN1=		xmlcatmgr.1

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=		DEFAULT_CATALOG_SGML=${CATALOG_PORTS_SGML} \
			DEFAULT_CATALOG_XML=${CATALOG_PORTS_XML}
.if defined(NOPORTDOCS)
CONFIGURE_ARGS+=	--disable-docs
.endif

PKGINSTALL=		${WRKDIR}/pkg-install.sh
PKGDEINSTALL=		${WRKDIR}/pkg-deinstall.sh
SUB_FILES=		pkg-message

COMMONVARS=		${WRKDIR}/commonvars.sh
XMLCATMGR?=		${PREFIX}/bin/xmlcatmgr
CATALOG_MASTER_SGML?=	${PREFIX}/share/sgml/catalog
CATALOG_PORTS_SGML?=	${PREFIX}/share/sgml/catalog.ports
CATALOG_MASTER_XML?=	${PREFIX}/share/xml/catalog
CATALOG_PORTS_XML?=	${PREFIX}/share/xml/catalog.ports

post-build:
	@( ${ECHO} '#!/bin/sh'; \
	${ECHO} 'PATH=$${PATH}:/bin:/usr/bin:${LOCALBASE}/bin:${X11BASE}/bin'; \
	${ECHO} 'export PATH;'; \
	) > ${COMMONVARS}
.for V in XMLCATMGR CATALOG_MASTER_SGML CATALOG_MASTER_XML CATALOG_PORTS_SGML CATALOG_PORTS_XML
	@${ECHO} '${V}=${${V}}' >> ${COMMONVARS}
.endfor
	@${CAT} ${COMMONVARS} ${FILESDIR}/pkg-install.in > ${PKGINSTALL}
	@${CAT} ${COMMONVARS} ${FILESDIR}/pkg-deinstall.in > ${PKGDEINSTALL}
	@${CHMOD} 0555 ${PKGINSTALL} ${PKGDEINSTALL}


.include <bsd.port.mk>
