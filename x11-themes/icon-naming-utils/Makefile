PORTNAME=	icon-naming-utils
PORTVERSION=	0.8.90
PORTREVISION=	1
CATEGORIES=	x11-themes
MASTER_SITES=	https://tango.freedesktop.org/releases/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Utilities of the Tango project
WWW=		http://tango-project.org/

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	p5-XML-Simple>=0:textproc/p5-XML-Simple
RUN_DEPENDS=	p5-XML-Simple>=0:textproc/p5-XML-Simple

GNU_CONFIGURE=	yes
USES=		pathfix perl5 pkgconfig gmake

.include <bsd.port.mk>
