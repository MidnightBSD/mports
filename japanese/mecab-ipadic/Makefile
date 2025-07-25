PORTNAME=	mecab-ipadic
DISTVERSION=	2.7.0-20070801
PORTREVISION=	1
CATEGORIES=	japanese textproc
MASTER_SITES=	https://drive.google.com/uc?export=download&id=0B4y35FiV1wh7MWVlSDBCSXZMTXM&dummy=/

MAINTAINER=	ports@MidnightBSD.org
COMMENT?=	MeCab IPA dictionary meta-port
WWW=		https://taku910.github.io/mecab/

.if empty(PKGNAMESUFFIX)
USES=		metaport
OPTIONS_RADIO=	CHARSET
OPTIONS_RADIO_CHARSET=	EUCJP SHIFTJIS UTF8
OPTIONS_DEFAULT=UTF8
EUCJP_DESC=	Use EUC-JP as dictionary charset.
SHIFTJIS_DESC=	Use SHIFT-JIS as dictionary charset.
UTF8_DESC=	Use UTF-8 as dictionary charset.

EUCJP_RUN_DEPENDS=	ja-mecab-ipadic-eucjp>0:japanese/mecab-ipadic-eucjp
SHIFTJIS_RUN_DEPENDS=	ja-mecab-ipadic-sjis>0:japanese/mecab-ipadic-sjis
UTF8_RUN_DEPENDS=	ja-mecab-ipadic-utf8>0:japanese/mecab-ipadic-utf8
.endif

.if !empty(PKGNAMESUFFIX)
LICENSE=	NAIST ICOT
LICENSE_COMB=	multi
LICENSE_NAME_NAIST=	NAIST
LICENSE_NAME_ICOT=	ICOT
LICENSE_PERMS_NAIST=	dist-mirror dist-sell pkg-mirror pkg-sell auto-accept
LICENSE_PERMS_ICOT=	dist-mirror dist-sell pkg-mirror pkg-sell auto-accept
LICENSE_FILE_NAIST=	${WRKSRC}/COPYING
LICENSE_FILE_ICOT=	${WRKSRC}/COPYING

BUILD_DEPENDS=	ja-mecab>=0.94:japanese/mecab

USES=		perl5
USE_PERL5=	build

CONFIGURE_ARGS=	--with-dicdir=${PREFIX}/lib/mecab/dic/ipadic
GNU_CONFIGURE=	yes
NO_ARCH=	yes
WRKSRC=		${WRKDIR}/${PORTNAME}-${DISTVERSION}

.if ${PKGNAMESUFFIX} == "-eucjp"
CONFIGURE_ARGS+=--with-charset=euc-jp
.elif ${PKGNAMESUFFIX} == "-sjis"
CONFIGURE_ARGS+=--with-charset=shiftjis
.elif ${PKGNAMESUFFIX} == "-utf8"
CONFIGURE_ARGS+=--with-charset=utf-8
.endif

PLIST_FILES=	lib/mecab/dic/ipadic/char.bin \
		lib/mecab/dic/ipadic/dicrc \
		lib/mecab/dic/ipadic/left-id.def \
		lib/mecab/dic/ipadic/matrix.bin \
		lib/mecab/dic/ipadic/pos-id.def \
		lib/mecab/dic/ipadic/rewrite.def \
		lib/mecab/dic/ipadic/right-id.def \
		lib/mecab/dic/ipadic/sys.dic \
		lib/mecab/dic/ipadic/unk.dic

CONFLICTS_INSTALL=	ja-mecab-ipadic*

.endif # !empty(PKGNAMESUFFIX)

.include <bsd.port.mk>
