PORTNAME=	irssi
DISTVERSION=	1.3-dev-344
DISTVERSIONSUFFIX=	-gf57dcfe9
PORTREVISION=	1
PORTEPOCH=	1
CATEGORIES?=	irc

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Modular IRC client with many features

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/COPYING

# Until upstream makes a new release disable cpe
USES=		compiler:c11 gettext-runtime gnome meson localbase:ldflags \
		ncurses:base perl5 pkgconfig ssl
USE_GNOME=	glib20
USE_LDCONFIG=	yes

USE_GITHUB=	yes
GH_TAGNAME=	f57dcfe

PLIST_SUB+=	SITE_ARCH=${SITE_ARCH_REL}
MESON_ARGS=	-Dinstall-glib=no -Ddisable-gregex=no -Dstatic-dependency=no \
		-Dwith-fuzzer=no -Dwithout-textui=no

# Force OpenSSL from base
CPPFLAGS+=	-I${OPENSSLINC}
LDFLAGS+=	-L${OPENSSLLIB} -lcrypto -lssl -fuse-ld=lld

OPTIONS_DEFINE=		BOT CAPSICUM DOCS OTR PERL PROXY TRUECOLOR UTF8PROC
OPTIONS_DEFAULT=	BOT CAPSICUM PERL PROXY TRUECOLOR
OPTIONS_SUB=		yes

BOT_DESC=		Bot support
CAPSICUM_DESC=		Capsicum support
OTR_DESC=		OTR (off-the-record) support
TRUECOLOR_DESC=		True color support
UTF8PROC_DESC=		utf8proc support

BOT_MESON_YES=		with-bot
CAPSICUM_MESON_YES=	with-capsicum
OTR_LIB_DEPENDS=	libgcrypt.so:security/libgcrypt \
			libotr.so:security/libotr
OTR_MESON_YES=		with-otr
PERL_MESON_YES=		with-perl
PROXY_MESON_YES=	with-proxy
TRUECOLOR_MESON_YES=	enable-true-color
UTF8PROC_LIB_DEPENDS=	libutf8proc.so:textproc/utf8proc
UTF8PROC_MESON_NO=	disable-utf8proc

PERL5_USE_OFF=	perl5=build

post-install-PERL-off:
	@${RM} -r ${STAGEDIR}${DATADIR}/scripts

post-install:
	${INSTALL_DATA} ${WRKSRC}/irssi.conf ${STAGEDIR}${PREFIX}/etc/irssi.conf.sample

.include <bsd.port.mk>
