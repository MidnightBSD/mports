PORTNAME=	fstyp
PORTVERSION=	0.1
CATEGORIES=	filesystems sysutils
MASTER_SITES=	SF/${PORTNAME}/${PORTNAME}/${PORTNAME}-${PORTVERSION} http://thegaul.org/src/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Detect which filesystem type a device/partition contains
WWW=		http://nchc.dl.sourceforge.net/sourceforge/fstyp/

LICENSE=	gpl2

USES=		gmake
GNU_CONFIGURE=	yes
GNU_CONFIGURE_MANPREFIX=${PREFIX}/share
CONFIGURE_ENV+=	ac_cv_prog_CC="${CC}"

PLIST_FILES=	bin/fstyp share/man/man8/fstyp.8.gz

.include <bsd.port.mk>
