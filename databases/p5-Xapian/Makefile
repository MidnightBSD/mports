PORTNAME=	Xapian
PORTVERSION=	1.4.29.0
CATEGORIES=	databases perl5
MASTER_SITES=	https://oligarchy.co.uk/xapian/${PORTVERSION:R}/ \
		LOCAL/sunpoet
PKGNAMEPREFIX=	p5-
DISTNAME=	xapian-bindings-${PORTVERSION:R}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl binding for Xapian
WWW=		https://xapian.org/

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	xapian-core>=${PORTVERSION:R}:databases/xapian-core
LIB_DEPENDS=	libxapian.so:databases/xapian-core

USES=		compiler:c++11-lang libtool perl5 tar:xz

CONFIGURE_ARGS=	--datarootdir=${DATADIR} \
		--docdir=${DOCSDIR} \
		--enable-shared \
		--enable-static \
		--with-perl \
		--without-csharp \
		--without-java \
		--without-lua \
		--without-php \
		--without-python \
		--without-python3 \
		--without-ruby \
		--without-tcl
GNU_CONFIGURE=	yes
INSTALL_TARGET=	install-strip
LDFLAGS+=	-L${LOCALBASE}/lib/perl5/${PERL_VER}/mach/CORE -lperl
USE_CXXSTD=	c++11

PORTSCOUT=	limitw:1,even

OPTIONS_DEFINE=	DOCS

DOCS_EXTRA_PATCHES_OFF=	${PATCHDIR}/extra-patch-perl-Makefile.in

post-install:
	${STRIP_CMD} ${STAGEDIR}${PREFIX}/${SITE_ARCH_REL}/auto/Xapian/Xapian.so

.include <bsd.port.mk>
