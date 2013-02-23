# $MidnightBSD: mports/print/pdflib/Makefile,v 1.12 2011/02/02 21:18:50 laffer1 Exp $

PORTNAME=	pdflib
PORTVERSION=	7.0.5
CATEGORIES=	print perl5 java
MASTER_SITES=	http://www.pdflib.com/binaries/PDFlib/${PORTVERSION:S/.//g}/
DISTNAME=	PDFlib-Lite-${PORTVERSION}p3

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A C library for dynamically generating PDF
LICENSE=	restricted

RESTRICTED=	many odd restrictions on usage and distribution

USE_LDCONFIG=	yes
USE_GMAKE=	yes
#USE_AUTOTOOLS=	libtool
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
USE_PERL5=	yes
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
