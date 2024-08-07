# Created by: roam@FreeBSD.org

PORTNAME=	libelf
PORTVERSION=	0.8.13
PORTREVISION=	3
CATEGORIES=	devel
MASTER_SITES=	NETBSD

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Public ELF file access library similar to libelf(3) in Solaris

LICENSE=	lgpl

CONFLICTS_INSTALL=	elfutils

OPTIONS_DEFINE=	EXTENDED NLS SANITY
OPTIONS_DEFAULT=	EXTENDED SANITY

EXTENDED_DESC=	ELF format extensions
SANITY_DESC=	Avoid loading invalid ELF files

.include <bsd.mport.options.mk>

GNU_CONFIGURE=	yes
CONFIGURE_ARGS+=	--enable-shared --disable-compat
CONFIGURE_TARGET=	${ARCH}-portbld-freebsd10.4
USE_LDCONFIG=	yes
USES=		desthack pathfix

.if ${PORT_OPTIONS:MNLS}
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib -lintl
CONFIGURE_ARGS+=	--enable-nls
USES+=		gettext
PLIST_SUB+=	GETTEXT=""
.else
CONFIGURE_ARGS+=	--disable-nls
PLIST_SUB+=	GETTEXT="@comment "
.endif

.if ${PORT_OPTIONS:MEXTENDED}
CONFIGURE_ARGS+=	--enable-extended-format
.else
CONFIGURE_ARGS+=	--disable-extended-format
.endif

.if ${PORT_OPTIONS:MSANITY}
CONFIGURE_ARGS+=	--enable-sanity-checks
.else
CONFIGURE_ARGS+=	--disable-sanity-checks
.endif

.include <bsd.port.mk>
