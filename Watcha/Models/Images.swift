//
//  Images.swift
//  Watcha
//
//  Created by 강민규 on 2022/05/25.
//

import Foundation

struct Images {
    struct fixed_height {
        var url: String
        var width: String
        var height: String
        var size: String
        var mp4: String
        var mp4_size: String
        var webp: String
        var webp_size: String
        
    }
    struct fixed_height_still {
        var url: String
        var width: String
        var height: String
        
    }
    struct fixed_height_downsampled {
        var url: String
        var width: String
        var height: String
        var size: String
        var webp: String
        var webp_size: String
        
    }
    struct fixed_width {
        var url: String
        var width: String
        var height: String
        var size: String
        var mp4: String
        var mp4_size: String
        var webp: String
        var webp_size: String
        
    }
    struct fixed_width_still {
        var url: String
        var width: String
        var  height: String
    }
    struct fixed_width_downsampled {
        var url: String
        var width: String
        var height: String
        var size: String
        var webp: String
        var webp_size: String
        
    }
    
    struct fixed_height_small {
        var url: String
        var width: String
        var height: String
        var size: String
        var mp4: String
        var mp4_size: String
        var webp: String
        var webp_size: String
    }
    
    struct fixed_height_small_still {
        var url: String
        var width: String
        var height: String
    }
    
    struct fixed_width_small {
        var url: String
        var width: String
        var height: String
        var size: String
        var mp4: String
        var mp4_size: String
        var webp: String
        var webp_size: String
    }
    
    struct fixed_width_small_still {
        var url: String
        var width: String
        var height: String
    }
    
    struct downsized {
        var url: String
        var width: String
        var height: String
    }
    
    struct downsized_large {
        var url: String
        var width: String
        var height: String
        var size: String
    }
    
    struct downsized_medium {
        var url: String
        var width: String
        var height: String
        var size: String
    }
    
    struct downsized_small {
        var url: String
        var width: String
        var height: String
        var size: String
    }
    
    struct original {
        var width: String
        var height: String
        var size: String
        var frames: String
        var mp4: String
        var mp4_size: String
        var webp: String
        var webp_size: String
        
    }
    struct original_still {
        var url: String
        var width: String
        var height: String
    }
    
    struct looping {
        var mp4: String
        
    }
    
    struct preview {
        var mp4: String
        var mp4_size: String
        var width: String
        var height: String
        
    }
    
    struct preview_gif {
        var url: String
        var width: String
        var height: String
        
    }
    
}
