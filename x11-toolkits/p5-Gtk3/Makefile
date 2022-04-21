PORTNAME=	Gtk3
PORTVERSION=	0.034
CATEGORIES=	x11-toolkits lang perl5
MASTER_SITES=	CPAN SF/${PORTNAME:tl}-perl/${PORTNAME}/${PORTVERSION}
MASTER_SITE_SUBDIR=	CPAN:XAOC
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl module for Gtk+ 3.x graphical user interface library

LICENSE=	lgpl2.1
LICENSE_FILE_lgpl2.1+ =	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-Cairo-GObject>=1:devel/p5-Cairo-GObject \
		p5-Glib-Object-Introspection>=0.016:devel/p5-Glib-Object-Introspection

NO_ARCH=	yes
USES=		gnome perl5
USE_PERL5=	configure
USE_GNOME=	gtk30

.include <bsd.port.mk>
