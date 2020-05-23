# Created by: Zhihao Yuan <lichray@gmail.com>

PORTNAME=	gbdfed
PORTVERSION=	1.6
CATEGORIES=	x11-fonts
MASTER_SITES=	http://sofia.nmsu.edu/~mleisher/Software/gbdfed/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GTK2 bitmap font editor

LICENSE=	mit

USES=		gettext gnome pkgconfig tar:bzip2
USE_GNOME=	gtk20
GNU_CONFIGURE=	yes
CPPFLAGS+=	-I${LOCALBASE}/include

PLIST_FILES=	bin/gbdfed \
		man/man1/gbdfed.1.gz

.include <bsd.port.mk>
