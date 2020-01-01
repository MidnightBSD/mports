# Created by: kmoore@FreeBSD.org
# $FreeBSD: head/sysutils/grub2-bhyve/Makefile 449591 2017-09-10 20:55:38Z gerald $
# $MidnightBSD$

PORTNAME=	grub2-bhyve
DISTVERSIONPREFIX=	v
DISTVERSION=	0.40
PORTREVISION=	3
CATEGORIES=	sysutils

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Grub-emu loader for bhyve

LICENSE=	gpl3

BUILD_DEPENDS=	${LOCALBASE}/bin/flex:textproc/flex \
		help2man:misc/help2man

ONLY_FOR_ARCHS=	amd64
SSP_UNSAFE=	yes
USE_GITHUB=	yes
GH_ACCOUNT=	grehan-freebsd
USES=		bison gmake
USE_GCC=	yes
PLIST_FILES=	sbin/grub-bhyve
MAKE_JOBS_UNSAFE=	yes
CONFIGURE_ARGS=	--with-platform=emu CC=${CC} LEX=${LOCALBASE}/bin/flex \
		--enable-grub-mount=no --enable-grub-mkfont=no \
		--enable-grub-emu-sdl=no --disable-nls --disable-werror \
		--host=${ARCH}-portbld-freebsd10.4 --build=${ARCH}-portbld-freebsd10.4

post-patch:
	@${REINPLACE_CMD} -e "s/libintl\.h/I_do_not_want_libintl.h/g" ${WRKSRC}/configure
	@${REINPLACE_CMD} -e "s/-lintl//g" ${WRKSRC}/grub-core/Makefile.in

do-configure:
	@ cd ${WRKSRC}/ && ./configure ${CONFIGURE_ARGS}

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/grub-core/grub-emu ${FAKE_DESTDIR}${LOCALBASE}/sbin/grub-bhyve

.include <bsd.port.mk>

RUN_DEPENDS:=	${RUN_DEPENDS:Ngcc*}
