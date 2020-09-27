# Created by: clsung@dragon2.net

PORTNAME=	Glib
PORTVERSION=	1.3292
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN \
		SF/gtk2-perl/${PORTNAME}/${PORTVERSION}
MASTER_SITE_SUBDIR=	CPAN:XAOC
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	This module provides access to Glib and GObject libraries

LICENSE=	lgpl2.1
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-ExtUtils-Depends>=0.300:devel/p5-ExtUtils-Depends \
		p5-ExtUtils-PkgConfig>=1.000:devel/p5-ExtUtils-PkgConfig

USES=		gnome perl5
USE_GNOME=	glib20
USE_PERL5=	configure

MAKE_JOBS_UNSAFE=	yes

.include <bsd.port.mk>
