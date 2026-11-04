PORTNAME=	Glib
PORTVERSION=	1.3294
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN \
		SF/gtk2-perl/Glib/${PORTVERSION}
MASTER_SITE_SUBDIR=	CPAN:XAOC
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Interface to Glib and GObject libraries
WWW=		https://gtk2-perl.sourceforge.net/

LICENSE=	lgpl2.1
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-ExtUtils-Depends>=0.300:devel/p5-ExtUtils-Depends \
		p5-ExtUtils-PkgConfig>=1.000:devel/p5-ExtUtils-PkgConfig

USES=		gnome perl5
USE_GNOME=	glib20
USE_PERL5=	configure

MAKE_JOBS_UNSAFE=	yes

post-install:
	${STRIP_CMD} ${PREFIX}/${SITE_ARCH_REL}/auto/Glib/Glib.so

.include <bsd.port.mk>
