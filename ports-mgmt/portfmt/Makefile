PORTNAME=	portfmt
DISTVERSION=	1.1.5
CATEGORIES=	ports-mgmt
MASTER_SITES=	https://codeberg.org/attachments/585aad14-d6b4-47e4-b8fa-813cb0fcf020?dummy=/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Format Ports Makefiles
WWW=		https://codeberg.org/tobik/portfmt

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
		-e 's/FreeBSD/Midnightbsd/g' \
		${WRKSRC}/rules.c \
		${WRKSRC}/man/portedit.1 \
		${WRKSRC}/tests/edit/apply/refactor_sanitize_append_modifier_0001.t \
		${WRKSRC}/tests/format/output_port_options_mk.t

.include <bsd.port.mk>
