PORTNAME=	irssi
DISTVERSION=	1.2.3
PORTREVISION=	1
PORTEPOCH=	2
CATEGORIES?=	irc
MASTER_SITES=	https://github.com/irssi/irssi/releases/download/${PORTVERSION}/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Modular IRC client with many features

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/COPYING

# Until upstream makes a new release disable cpe
USES=		autoreconf cpe gettext-runtime gmake gnome libtool localbase \
		ncurses pkgconfig tar:xz
USE_GNOME=	glib20

GNU_CONFIGURE=	yes
INSTALL_TARGET=	install-strip

PLIST_SUB+=	SITE_ARCH=${SITE_ARCH_REL}

# Force OpenSSL from base
CPPFLAGS+=	-I${OPENSSLINC}
LDFLAGS+=	-L${OPENSSLLIB} -lcrypto -lssl -fuse-ld=lld

OPTIONS_DEFINE=		BOT CAPSICUM DOCS OTR PERL PROXY SOCKS TRUECOLOR \
			UTF8PROC
OPTIONS_DEFAULT=	BOT CAPSICUM PERL PROXY SOCKS TRUECOLOR
OPTIONS_SUB=		yes

BOT_DESC=			Bot support
BOT_CONFIGURE_WITH=		bot
CAPSICUM_DESC=			Capsicum support
CAPSICUM_CONFIGURE_WITH=	capsicum
OTR_DESC=			OTR (off-the-record) support
OTR_CONFIGURE_ON=		--with-libotr-inc-prefix=${PREFIX}/include
OTR_CONFIGURE_OFF=		--with-otr=no
OTR_CONFIGURE_WITH=		otr
OTR_LIB_DEPENDS=		libgcrypt.so:security/libgcrypt \
				libgpg-error.so:security/libgpg-error \
				libotr.so:security/libotr
PERL_USES=			perl5
PERL_CONFIGURE_ON=		--with-perl-lib=site
PERL_CONFIGURE_OFF=		--with-perl=no
PROXY_CONFIGURE_WITH=		proxy
SOCKS_CONFIGURE_WITH=		socks
TRUECOLOR_DESC=			True color support
TRUECOLOR_CONFIGURE_ENABLE=	true-color
UTF8PROC_DESC=			utf8proc support
UTF8PROC_LIB_DEPENDS=		libutf8proc.so:textproc/utf8proc
UTF8PROC_CONFIGURE_ENABLE=	utf8proc

.if defined(WITHOUT_SSL)
CONFIGURE_ARGS+=	--disable-ssl
.else
USES+=		ssl
.endif

PERL5_USE_OFF=	perl5=build

post-install-PERL-off:
	@${RM} -r ${FAKE_DESTDIR}${DATADIR}/scripts

post-install-PERL-on:
	${STRIP_CMD} ${FAKE_DESTDIR}${PREFIX}/${SITE_ARCH_REL}/auto/Irssi/Irssi.so
	${STRIP_CMD} ${FAKE_DESTDIR}${PREFIX}/${SITE_ARCH_REL}/auto/Irssi/Irc/Irc.so
	${STRIP_CMD} ${FAKE_DESTDIR}${PREFIX}/${SITE_ARCH_REL}/auto/Irssi/TextUI/TextUI.so
	${STRIP_CMD} ${FAKE_DESTDIR}${PREFIX}/${SITE_ARCH_REL}/auto/Irssi/UI/UI.so

post-install:
	${INSTALL_DATA} ${WRKSRC}/irssi.conf ${PREFIX}/etc/irssi.conf.sample

.include <bsd.port.mk>
