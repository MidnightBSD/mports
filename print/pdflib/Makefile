PORTNAME=	pdflib
PORTVERSION=	7.0.5
PORTREVISION=	2
CATEGORIES=	print perl5 java
MASTER_SITES=	http://www.pdflib.com/binaries/PDFlib/${PORTVERSION:S/.//g}/
DISTNAME=	PDFlib-Lite-${PORTVERSION}p3

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	C library for dynamically generating PDF

LICENSE=	pdflib
LICENSE_NAME=	PDFLib Lite License Agreement
LICENSE_PERMS=	dist-mirror pkg-mirror
LICENSE_TEXT=	Free for private or research use, and for open source use

USE_LDCONFIG=	yes
USES=		gmake libtool perl5
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-py=no --with-ruby=no --with-tcl=no \
		--enable-shared=yes --enable-static=yes

OPTIONS=	PERL	"Enable Perl bindings"	On \
		JAVA	"Enable Java bindings"	Off

PORTDOCS=	*

.include <bsd.port.pre.mk>

.if ${ARCH} == "amd64" || ${ARCH} == "sparc64"
CONFIGURE_ARGS+=--enable-64bit
.endif

.if defined(WITH_PERL)
PLIST_SUB=	PERL=""
CONFIGURE_ARGS+=--with-perl=${PERL}
.else
CONFIGURE_ARGS+=--with-perl=no
PLIST_SUB=	PERL="@comment "
.endif

.if defined(WITH_JAVA)
USE_JAVA=	yes
JAVA_BUILD=	yes
JAVA_RUN=	yes
PLIST_SUB+=	JAVA=""
CONFIGURE_ARGS+=--with-java=${JAVA_HOME}
.else
CONFIGURE_ARGS+=--with-java=no
PLIST_SUB+=	JAVA="@comment "
.endif

post-patch:
	${MKDIR} ${FAKE_DESTDIR}/${SITE_PERL}/${PERL_ARCH}

post-install:
	${MKDIR} ${DATADIR}/fonts
	${INSTALL_DATA} ${WRKSRC}/fonts/* ${DATADIR}/fonts
.if defined(WITH_JAVA)
	${INSTALL_DATA} ${WRKSRC}/bind/pdflib/java/pdflib.jar ${JAVAJARDIR}/pdflib.jar
.endif
.if !defined(NOPORTDOCS)
	${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/doc/pdflib/* ${DOCSDIR}
.endif

.include <bsd.port.post.mk>
