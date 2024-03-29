PORTNAME=	jade
PORTVERSION=	1.2.1
PORTREVISION=	13
CATEGORIES=	textproc
MASTER_SITES=	ftp://ftp.jclark.com/pub/jade/ \
		http://dist.bsdlab.org/

#PATCH_SITES=	http://ftp.debian.org/debian/pool/main/j/jade/
PATCH_SITES=	http://dist.bsdlab.org/
PATCHFILES=	jade_1.2.1-35.diff.gz
PATCH_DIST_STRIP=	-p1

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Object-oriented SGML/XML parser toolkit and DSSSL engine

LICENSE=	mit

CONFLICTS=	sp-1.*

RUN_DEPENDS=	${XMLCATMGR}:textproc/xmlcatmgr

USES=		desthack libtool gmake
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
CONFIGURE_ARGS=	--enable-default-catalog=${PREFIX}/share/sgml/catalog \
		--enable-shared --enable-static
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
