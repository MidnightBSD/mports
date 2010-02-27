# $MidnightBSD$

PORTNAME=	libdiscid
PORTVERSION=	0.2.2
CATEGORIES=	audio
MASTER_SITES=	http://users.musicbrainz.org/~matt/ \
		${MASTER_SITE_GENTOO}
MASTER_SITE_SUBDIR=	distfiles

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A library for creating MusicBrainz DiscIDs
LICENSE=	lgpl

GNU_CONFIGURE=	yes
USE_GNOME=	pkgconfig
USE_LDCONFIG=	yes

.include <bsd.port.pre.mk>

pre-configure:
	@${REINPLACE_CMD} -e 's|\$$(libdir)/pkgconfig|\$$(prefix)/libdata/pkgconfig|' \
		${WRKSRC}/Makefile.in

.include <bsd.port.post.mk>
