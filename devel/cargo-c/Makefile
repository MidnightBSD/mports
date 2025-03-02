PORTNAME=	cargo-c
DISTVERSION=	0.9.27
DISTVERSIONSUFFIX=	+cargo-0.74.0
PORTREVISION=	2
CATEGORIES=	devel
MASTER_SITES=	CRATESIO
# XXX Teach USES=cargo to have proper default
DISTFILES=	${CARGO_DIST_SUBDIR}/${DISTNAME}${CARGO_CRATE_EXT}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Cargo C-ABI helpers
WWW=		https://github.com/lu-zero/cargo-c

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

LIB_DEPENDS=	libcurl.so:ftp/curl

USES=		cargo ssl
PLIST_FILES=	bin/cargo-capi \
		bin/cargo-cbuild \
		bin/cargo-cinstall \
		bin/cargo-ctest \
		${NULL}

NO_TEST=	yes

.include <bsd.port.pre.mk>

# prevent address space exhaustion on armv6/armv7
.if ${ARCH:Marmv?}
LTO_UNSAFE=	yes
.endif

post-patch:
	@${REINPLACE_CMD} -e 's,libdir.join("pkgconfig,prefix.join("libdata/pkgconfig,' \
		${WRKSRC}/src/install.rs
	# XXX Need devel/libgit2 >= 1.6.4; libgit2 depends on libssh2, so bundle both
	@${REINPLACE_CMD} 's/if try_to_use_system_libgit2/if false/' \
		${WRKSRC}/cargo-crates/libgit2-sys-*/build.rs
	@${REINPLACE_CMD} '/env::var/s/LIBSSH2.*PKG/disabled_&/' \
		${WRKSRC}/cargo-crates/libssh2-sys-*/build.rs

.include <bsd.port.post.mk>
