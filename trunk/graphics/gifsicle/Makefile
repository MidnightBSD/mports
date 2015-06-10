# Created by: Brad Hendrickse <bradh@iafrica.com>
# $MidnightBSD$
# $FreeBSD: head/graphics/gifsicle/Makefile 363294 2014-07-29 06:17:30Z vanilla $

PORTNAME=	gifsicle
PORTVERSION=	1.87
CATEGORIES=	graphics
MASTER_SITES=	http://www.lcdf.org/gifsicle/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Manipulates GIF images and animations

LICENSE=	gpl2

GNU_CONFIGURE=	yes

PORTDOCS=	NEWS README.md
PLIST_FILES=	bin/gifdiff bin/gifsicle \
		man/man1/gifdiff.1.gz man/man1/gifsicle.1.gz

OPTIONS_DEFINE=		DOCS X11
OPTIONS_DEFAULT=	X11
OPTIONS_SUB=		yes

X11_USE=		xorg=x11
X11_CONFIGURE_ENABLE=	gifview
X11_CONFIGURE_WITH=	x
X11_PLIST_FILES=	bin/gifview man/man1/gifview.1.gz

post-install:
	@${MKDIR} ${STAGEDIR}${DOCSDIR}
	(cd ${WRKSRC} && ${INSTALL_DATA} ${PORTDOCS} ${STAGEDIR}${DOCSDIR})

.include <bsd.port.mk>
