PORTNAME=	xclip
PORTVERSION=	0.13
CATEGORIES=	x11

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Interface to X selections ("the clipboard") from the command line

LICENSE=	gpl2

USE_GITHUB=	yes
GH_ACCOUNT=	astrand

USES=		autoreconf gmake iconv:wchar_t xorg
USE_XORG=	x11 xmu

GNU_CONFIGURE=	yes
CONFIGURE_ENV+=	ac_cv_header_X11_Xmu_Atoms_h=yes \
		ac_cv_header_X11_Intrinsic_h=yes \
		ac_cv_lib_Xmu_XmuClientWindow=yes
CFLAGS+=	-I/usr/local/include -liconv -L/usr/local/lib
LDFLAGS+=	-L/usr/local/lib 

PLIST_FILES=	bin/xclip bin/xclip-copyfile bin/xclip-cutfile \
		bin/xclip-pastefile \
		man/man1/xclip.1.gz man/man1/xclip-copyfile.1.gz

post-patch:
	${REINPLACE_CMD} 's,mktemp,mktemp -t xclip,' ${WRKSRC}/xclip-copyfile

post-install:
	${STRIP_CMD} ${STAGEDIR}${PREFIX}/bin/xclip

.include <bsd.port.mk>
