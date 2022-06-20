PORTNAME=	portfmt
DISTVERSION=	1.1.2
CATEGORIES=	ports-mgmt
MASTER_SITES=	https://github.com/t6/portfmt/releases/download/v${DISTVERSION}/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Format Ports Makefiles

LICENSE=	bsd2
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		compiler:c11 ninja tar:lz
HAS_CONFIGURE=	yes
CONFIGURE_ARGS=	AR="${AR}" \
		CC="${CC}" \
		CFLAGS="${CFLAGS}" \
		CPPFLAGS="${CPPFLAGS}" \
		DESTDIR="${FAKE_DESTDIR}" \
		INSTALL_MAN="${INSTALL_MAN}" \
		INSTALL_PROGRAM="${INSTALL_PROGRAM}" \
		LDFLAGS="${LDFLAGS}" \
		PREFIX="${PREFIX}"

OPTIONS_DEFINE=	SUBPACKAGES

SUBPACKAGES_DESC=	Subpackages support (D16457)

SUBPACKAGES_CONFIGURE_OFF=	FEATURES="!subpackages"

post-patch:
	${REINPLACE_CMD} -e 's/bsd.port.options.mk/bsd.mport.options.mk/g' \
		${WRKSRC}/rules.c \
		${WRKSRC}/man/portedit.1 \
		${WRKSRC}/tests/edit/apply/refactor_sanitize_append_modifier_0001.t \
		${WRKSRC}/tests/format/output_port_options_mk.t

.include <bsd.port.mk>
