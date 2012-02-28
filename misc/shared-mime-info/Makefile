# $MidnightBSD: mports/misc/shared-mime-info/Makefile,v 1.7 2011/05/14 22:30:47 laffer1 Exp $

PORTNAME=	shared-mime-info
PORTVERSION=	0.90
CATEGORIES=	misc gnome
MASTER_SITES=	http://people.freedesktop.org/~hadess/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A MIME type database from the FreeDesktop project
LICENSE=	gpl2

USE_BZIP2=	yes
GNU_CONFIGURE=	yes
USE_GETTEXT=	yes
USE_GMAKE=	yes
USE_GNOME=	glib20 libxml2 intltool gnomehack intlhack
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"
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
