# New ports collection makefile for:	jade
#
# $MidnightBSD: mports/textproc/jade/Makefile,v 1.7 2011/02/02 21:23:47 laffer1 Exp $
# $FreeBSD: ports/textproc/jade/Makefile,v 1.50 2006/02/23 10:39:21 ade Exp $
#

PORTNAME=	jade
PORTVERSION=	1.2.1
PORTREVISION=	11
CATEGORIES=	textproc
MASTER_SITES=	ftp://ftp.jclark.com/pub/jade/ \
		http://dist.bsdlab.org/

#PATCH_SITES=	http://ftp.debian.org/debian/pool/main/j/jade/
PATCH_SITES=	http://dist.bsdlab.org/
PATCHFILES=	jade_1.2.1-35.diff.gz
PATCH_DIST_STRIP=	-p1

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	An object-oriented SGML/XML parser toolkit and DSSSL engine
LICENSE=	mit

CONFLICTS=	sp-1.*

RUN_DEPENDS=	${XMLCATMGR}:${PORTSDIR}/textproc/xmlcatmgr

USE_GMAKE=	yes
GNU_CONFIGURE=	yes
USE_AUTOTOOLS=	libtool
USE_LDCONFIG=	yes
CONFIGURE_ARGS=	--enable-default-catalog=${PREFIX}/share/sgml/catalog
PLIST_SUB=	XMLCATMGR=${XMLCATMGR}
PLIST_SUB+=	CATALOG_PORTS_SGML=${CATALOG_PORTS_SGML}
MAKE_JOBS_UNSAFE=	yes
FAKE_OPTS=	prefixhack

CATALOG_PORTS_SGML=	${PREFIX}/share/sgml/catalog.ports
XMLCATMGR=	${LOCALBASE}/bin/xmlcatmgr

post-extract:
	@${CHMOD} u+w ${WRKSRC}/configure

pre-install:
	@${FIND} ${WRKSRC} \( -name \*.orig -o -name \*~ \) \
		-exec ${RM} -f \{} \;

post-install:
.for i in jade nsgmls sgmlnorm spam spent sx
	${STRIP_CMD} ${PREFIX}/bin/$i
.endfor
	${MKDIR} ${PREFIX}/include/sp
	${INSTALL_DATA} ${WRKSRC}/include/* ${PREFIX}/include/sp
	${MKDIR} ${PREFIX}/share/doc/jade
	${INSTALL_DATA} ${WRKSRC}/doc/*.htm ${PREFIX}/share/doc/jade
	${MKDIR} ${PREFIX}/share/sgml/jade
	${INSTALL_DATA} ${WRKSRC}/dsssl/* ${PREFIX}/share/sgml/jade
	${MKDIR} ${PREFIX}/share/xml/jade
	${INSTALL_DATA} ${WRKSRC}/pubtext/xml* ${PREFIX}/share/xml/jade

.include <bsd.port.pre.mk>

# Same problem with textproc/openjade.
CPPFLAGS:=	-O ${CFLAGS:N-O*:N-m*}

.include <bsd.port.post.mk>
