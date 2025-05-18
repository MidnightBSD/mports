PORTNAME=	pdflib
PORTVERSION=	7.0.5
PORTREVISION=	3
CATEGORIES=	print perl5 java
#MASTER_SITES=	http://www.pdflib.com/binaries/PDFlib/${PORTVERSION:S/.//g}/
MASTER_SITES=	FREEBSD_LOCAL/ale:src	\
		FREEBSD_LOCAL/crees:license
DISTNAME=	PDFlib-Lite-${PORTVERSION}p3

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	C library for dynamically generating PDF
WWW=		http://www.pdflib.de/

LICENSE=	pdflib
LICENSE_NAME=	PDFLib Lite License Agreement
LICENSE_PERMS=	dist-mirror pkg-mirror
LICENSE_TEXT=	Free for private or research use, and for open source use

BUILD_DEPENDS=	gsed:textproc/gsed

USE_LDCONFIG=	yes
USES=		cpe gmake libtool
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-py=no --with-ruby=no --with-tcl=no \
		--enable-shared=yes --enable-static=yes
BINARY_ALIAS=	sed=${LOCALBASE}/bin/gsed

OPTIONS_DEFINE=       PERL JAVA DOCS
OPTIONS_SUB=  yes
PERL_DESC=    Build perl bindings
JAVA_DESC=    Build Java bindings

JAVA_USES=            java
PERL_CONFIGURE_WITH=  perl=${PERL}
PERL_USES=    perl5

PORTDOCS=	*

.include <bsd.mport.options.mk>

.if ${ARCH} == "amd64"
CONFIGURE_ARGS+=--enable-64bit
.endif

.if ${PORT_OPTIONS:MJAVA}
CONFIGURE_ARGS+=--with-java=${JAVA_HOME}
.else
CONFIGURE_ARGS+=--with-java=no
.endif

post-patch:
	${MKDIR} ${FAKE_DESTDIR}/${SITE_PERL}/${PERL_ARCH}

post-install:
	${MKDIR} ${DATADIR}/fonts
	${INSTALL_DATA} ${WRKSRC}/fonts/* ${DATADIR}/fonts

post-install-DOCS-on:
	${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/doc/pdflib/* ${FAKE_DESTDIR}${DOCSDIR}

post-install-JAVA-on:
	${INSTALL_DATA} ${WRKSRC}/bind/pdflib/java/pdflib.jar ${FAKE_DESTDIR}${JAVAJARDIR}/pdflib.jar

.include <bsd.port.mk>
