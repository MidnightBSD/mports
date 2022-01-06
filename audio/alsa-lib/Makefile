PORTNAME=	alsa-lib
PORTVERSION=	1.2.2
CATEGORIES=	audio
MASTER_SITES=	ftp://ftp.alsa-project.org/pub/lib/ \
		GENTOO

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	ALSA compatibility library

LICENSE=	lgpl2.1

USES=		cpe libtool:keepla tar:bzip2
CPE_VENDOR=	alsa-project
CPE_PRODUCT=	alsa
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-pkgconfdir="\$${prefix}/libdata/pkgconfig"
CONFIGURE_ENV=	ac_cv_header_endian_h=no
INSTALL_TARGET=	install-strip
NO_TEST=	yes
CPPFLAGS+=	-I${FILESDIR}

OPTIONS_DEFINE=		PYTHON
OPTIONS_SUB=		yes

PYTHON_USES=			gettext-runtime python
PYTHON_CONFIGURE_ENABLE=	mixer-pymods python
PYTHON_BINARY_ALIAS=		python3-config=${PYTHON_CMD:T}-config

post-patch:
	@${REINPLACE_CMD} 's|%%PREFIX%%|${PREFIX}|g' \
		${WRKSRC}/src/conf/alsa.conf

post-install:
	${INSTALL_DATA} ${FILESDIR}/asound.conf.sample ${PREFIX}/etc

.include <bsd.port.mk>
