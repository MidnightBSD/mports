# $MidnightBSD: mports/misc/shared-mime-info/Makefile,v 1.9 2012/03/02 01:09:23 laffer1 Exp $

PORTNAME=	shared-mime-info
PORTVERSION=	1.0
CATEGORIES=	misc gnome
MASTER_SITES=	http://people.freedesktop.org/~hadess/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A MIME type database from the FreeDesktop project
LICENSE=	gpl2

USE_XZ=	yes
GNU_CONFIGURE=	yes
USE_GETTEXT=	yes
USE_GMAKE=	yes
USE_GNOME=	glib20 libxml2 intltool gnomehack intlhack pkgconfig
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib
MAKE_JOBS_UNSAFE=	yes

MAN1=		update-mime-database.1

PKGINSTALL=	${WRKDIR}/pkg-install

MIMEDIRS=	${LOCALBASE}/share/mime \
		${PREFIX}/share/mime
MIMESUBDIRS=	application audio image inode message model multipart \
		packages text video x-epoc x-content

post-patch:
	@${REINPLACE_CMD} -e 's|%%MIMEDIRS%%|${MIMEDIRS}|g' \
		${WRKSRC}/Makefile.in
	@${REINPLACE_CMD} -e 's|/usr/local|${LOCALBASE}|g' \
		${WRKSRC}/update-mime-database.c

pre-install:
.for subdir in ${MIMESUBDIRS}
	${MKDIR} ${PREFIX}/share/mime/${subdir}
.endfor

post-fake:
	@${SED} -e 's|%%PREFIX%%|${PREFIX}| ; \
		s|%%MIMEDIRS%%|${MIMEDIRS}|' \
		< ${FILESDIR}/pkg-install.in > ${PKGINSTALL}

.include <bsd.port.mk>
